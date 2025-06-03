Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EA5C5B555
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:36:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8972.1748950590407788330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NI48fNCM;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so36021755e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748950589; x=1749555389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPjn1yBQngbKyZLG/HZHAA5F+o2WTF0DrG1stIS6Fjs=;
        b=NI48fNCMttV5YDzD8qh816p1cxtK+qC1wkFQa/NDrBVd71tmM8rKyu5su0xEGjr3lm
         2XEcWDzHs6MenRPGEAbszj8cWdcnsSdxW/kxwxLD/frELL3JKyoy0yA6YLpa1VbV4Ihe
         dpVJZ/vucSeHbP+3EXI+htVdHMXEJY36/sYCoaIQ7iYSTefPlE8YiCzHawMouMtMOU8X
         DMA+O8Knv8QRkWGwBHHsEzPsUyIPaQ8A7h5V0xhmemqRqeyIrXnzSB8AubUIZDCvYZyt
         4IjQMIOvLQ2kFL8dz7ubsGM0qtDHOy1+pcQ1lJZZdwYa5k5if1vWmOx6IXApWikCUEro
         Lqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950589; x=1749555389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPjn1yBQngbKyZLG/HZHAA5F+o2WTF0DrG1stIS6Fjs=;
        b=gArDCA3hR5ufTsWDbjvzv6+FoQjciEdevokDb0IqutdcrXBM6Ay09djuDS9SYbENAY
         QXk0aEVJLzOvmQ82WLavbPoJrlJklYBdSo78pHSm+TGlZ4IQUm6ssMV+NbjnbHddOO5D
         3c72rDHW0DDqq3pgyVmkt/1bOAMoFsJ7kw4QjKn5WyJKOBhjQl3jXUpIDkBvwpdAUShg
         Aqr5YZ33hBwc4Ertop/DNUe+9BS1kKk9beDzy+2Ask0FzMN+8uBHwMz8TmAU1lrWKwAp
         BBRkQokQ0T+DLZiGTIM+Dd6lD7j4/TSJ3+LjALMHKen1XfR5Od78Nd6jz+Xgh56ekTAy
         /ccA==
X-Gm-Message-State: AOJu0Yy6zZuB91cOHakn6HgZ/fv9/czNqkZx+Zs+ytsXoJN3IExI5cUM
	4AYBsLvcr2cFg1ZxIgAkrtdru5kCEskEeVq6KSMZYVZ7wU0IUt8yXXDPe8DWAA==
X-Gm-Gg: ASbGncvcXAPesZZxrmB+i9g+NA16x6fmqO5jijl00JyGQJp12jO7UuMncSyaNWahrvk
	H+wQyVU1hyjbyLAzjx5yCfmzi9N5DwdJxvxPn2BZ36hY66eEPRbQrogtSus2ZgPypszfqwUuf+6
	7T9ADz2B/nzReJjj/Pw1lXFj/ESni+87mnKtnP2BuQP4NXLwPNhKymIj/OdL7g0k98C8ktcQb7K
	0DlJNtManMviPL7ZM+3Wx+Tp3DrCK/8aW3VdGd191dXZxgXBwVDYaPoYRek9728iTzKxFebLxAX
	Ynk1P4IQymfIuhbBrRuOZrlWgXFIYb2MxLzLgIh54kdoQS3u3BzqU3mlf1XKMQO9xR+Uy+1x+P+
	t9Ya+mVXRKkxE
X-Google-Smtp-Source: AGHT+IFaLOGIDyfC3VJ0fmJKaENLSnTQfmuyFzPmgbN/77CrU+TlPgN4NfEGzoPGGdL5JDLaki75eg==
X-Received: by 2002:a05:6000:220b:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a4f89ddde0mr12254896f8f.29.1748950588698;
        Tue, 03 Jun 2025 04:36:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm17728247f8f.43.2025.06.03.04.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:36:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] fragments/qemu: add support for enabling sdl in qemu
Date: Tue,  3 Jun 2025 13:36:20 +0200
Message-Id: <20250603113620.3104900-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603113620.3104900-1-alex.kanavin@gmail.com>
References: <20250603113620.3104900-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217808

From: Alexander Kanavin <alex@linutronix.de>

This has been the default in poky's local.conf template for
a long time, but it's not enabled directly in poky distro.
To allow better sstate reuse and a better user experience
on a typical laptop (qemu will pop up a graphical window directly),
let's add this fragment and enable it in official bitbake-setup
configurations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/qemu/enable-native-sdl.conf | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/conf/fragments/qemu/enable-native-sdl.conf

diff --git a/meta/conf/fragments/qemu/enable-native-sdl.conf b/meta/conf/fragments/qemu/enable-native-sdl.conf
new file mode 100644
index 00000000000..21c1298171e
--- /dev/null
+++ b/meta/conf/fragments/qemu/enable-native-sdl.conf
@@ -0,0 +1,8 @@
+BB_CONF_FRAGMENT_SUMMARY = "Enable SDL support for direct graphical output on the build host."
+BB_CONF_FRAGMENT_DESCRIPTION = "By default qemu is built with a internal VNC server \
+support. To see graphical output from the guest system, one can use a VNC client to \
+connect to it. This fragment enables Simple Directmedia Layer support, which allows \
+seeing the graphical output from guest directly in a X/Wayland session on the build host machine. \
+"
+
+PACKAGECONFIG:append:pn-qemu-system-native = " sdl"
-- 
2.39.5


