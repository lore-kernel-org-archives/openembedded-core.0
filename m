Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12B4E668AF
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 13:12:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.66476.1732453947357593543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 05:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kMWyH/8m;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431616c23b5so19604395e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 05:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732453945; x=1733058745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOh6hmW8ipLIQbCgqpwC3Wc9Gzoygwfr3i+psf1GFG8=;
        b=kMWyH/8mX+J62cm9Nl4+GdMQrn3AfvefElprrarXBG+Wn47nZkFUuwO0wA74xHd+ya
         RxHL2LiEl+DDlmkG2XQ7yji9pbMFCTKwLqzGtVs/Ez1TEF17ZDVsvjQOGp6ehRf7n+8i
         9cN8+WpDBWt3fjMgPRceRWlnBOnDKDWCtGHlShwBTCgVVGpGPaeJ6GAjD5l3OafNnIDc
         mkFRXpLGneV8QgWB/PMYs0Qup568ITXvq9wwli7/OI7wxvIrHwflGAM5Ptvlj+Uj0nmK
         Zjh7F/6mfL3pT7Wzkadc5rNBS0UXb+nbT9xtateGe17quMt16t/sJ7R0GUvKxFqi4f/f
         t5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732453945; x=1733058745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOh6hmW8ipLIQbCgqpwC3Wc9Gzoygwfr3i+psf1GFG8=;
        b=LwdHj8MDC33Xb8EvZ1BCYPbQl5g7ns9dlQN5aKX9i8b4IkXnDJ9N0OC3McpdKz82tN
         4Qq4DthrMw6Xut9b19l2qSXwq6JDfB/kmimDBj38hdAMVTK0WZuYP4AeVm+XdsDsMR3K
         5TKM2OO/2ZwXlFOJQkGUwqQUTf3/EvhK9i2iQjHJuIgAksiHAhYn2bu/qn1FB9DgowVV
         geljIQW7q+aulB2VVrYaKKb1bjthinagfjdN/DWn4+aoyI57wxvZwP+5cXArHxhpeElM
         QOFvyuhqPMlOlm5ZxPK2H5D3+LEPplhWhV9iomDmZsQBs8t4VIRsWe+Br5sbls65w9Fw
         5EAA==
X-Gm-Message-State: AOJu0YxM3f/QPufirIaF7rQrrLmdFAJpTkqlYz7Y27wFWZlwCXWQvFVq
	YONzEEu/8mJs/dm6UxKGCtoxQsmV9+6YUcK/IHLA8c3ifuYvwXWWfMwkqA==
X-Gm-Gg: ASbGncuLREI6aqJJGGuaJ9ZtsgnH9O9SjNYfSr4apP3WedCpeRX+YOPKyhsH51JRT2M
	uYga6hFyACCklEyWuSoAKdG18+fAhsk9qHGKQZw+WfaRMUww2Ln5XVCu6j6Y9GKh34Ut4QpfIhU
	XXRZOQd/v43ZgDBVdMN5KjxNAeCWovpP0JEJ+OM/LSbdVv9OprpdhB+nmRKV3W4GFgOPPPd15d0
	sEkDBLRytJ9gIVdLkJuwQuYgBsnIFmbvwfntG33pLDfzDnM7/gOunmo9mKa4BJ8CX7r/+DpILw=
X-Google-Smtp-Source: AGHT+IFo4Gb5RkHeBTBzp6IIZa5ZpAMRscxEUCxS9WCZqPH3P662uqqOGB53s79ScZXpswSg3MzxWw==
X-Received: by 2002:a7b:c355:0:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-433c5c956eamr106838675e9.5.1732453945221;
        Sun, 24 Nov 2024 05:12:25 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm7937103f8f.1.2024.11.24.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:12:24 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 2/2] systemd-boot: drop intltool-native from DEPENDS
Date: Sun, 24 Nov 2024 13:12:01 +0000
Message-ID: <20241124131201.708131-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124131201.708131-1-gudni.m.g@gmail.com>
References: <20241124131201.708131-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 13:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207705

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_256.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.7.bb b/meta/recipes-core/systemd/systemd-boot_256.7.bb
index 4f477b877a..9dac700c4e 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.7.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.7.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "ibcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.43.0


