Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E852DCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:51:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14408.1757501469409389083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XdN48CLB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45ded619608so15894075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501468; x=1758106268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GRZtW+0BtdwDZZdkR6/U9Bk2iWImoAcOQ37USeXVt4=;
        b=XdN48CLBULY5WoksdyQdBnnqOffwRlp4yZ3mmUjE4A3DEDyLVs8YpbMsxjOX4NF9U9
         hFCYanWAQgmCn66lBEaSenjf4QMsnTxVWuvNQzf7IEaFPoFhEHr8U1tpTS+s8wiSPI+3
         lIfUM99/ugOeNdbalFjXh8irMwAVKk/gg1nFvqDZTRbhRHSfVhxyTVgjuOADa0wc481d
         8cGYiMvwgKZHrrJeqWRsJaWN2/8AUf7sRZHMtIDq07qfXMYbju42CZp7xRe5z3J4+k6/
         JjQiiFSgch7QSmUJTMtLAI5p3Os+iLdOy7BsPZjflkCLy4biB02rnLNxzolcCKQCg/OQ
         85Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501468; x=1758106268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GRZtW+0BtdwDZZdkR6/U9Bk2iWImoAcOQ37USeXVt4=;
        b=BKauxngqVKvo3WETjuZKLFAhU6zG4gr9bC8/ym15rSMKkIy+k9Uch+YhrZtcSgH0P0
         g+dR0n74rwcVsSPpvTz1ZLFwDMWUolG/nAXbvn7tueDI6CBftb+N5uauWZXbeIyC5urT
         OBiH1UWtb9UeoBQf37thqgcgwF7az9AbCTJJ6PRVIyySqtdcB/y3nUM0gQkyMLPvcBqS
         KLnTxwjvgEl1CrAs0oE1uPTt+ydssJnEv7kZQBTJOx6uAKM/QWdZbooytfjgsC8enhqW
         LFi3dMsrYdYu8WXBToUCp7gi4+Zw77dXwvBH1RxOQWb8CwTfpZ7ZZnUI/H2jLiFdFPAb
         KwCQ==
X-Gm-Message-State: AOJu0Yzk125tDzMxX+amKg3n7mYY/40MLQirU8YwBNBj4a0k1crUwpRb
	as7rsjmYt+8JywMhXvgsH44tczToVhusjJ06RqdwCB4E/WqyvH7n/1A/wjsmig==
X-Gm-Gg: ASbGncuKiJPND9JznLia1HEYebTQUDI+8jdMEIsv0J/GpDR+yQfSm6Qu1iKqeI+rjO5
	31y3JRCwQdPjPfMS06RL6/U2g5YlIjC1qGe6Z+RUu1EbmQCguDCiUPA05ZJrIBCwXeR9GJbq9WT
	xA6FdjgRfDGJ3yCOqg/FQOswVFqLvO0ZU51fbGH5+z86RRbIrEJIr8Y+3liBu377x5KeY75HiAd
	3tlZAweXEDB9ul93D8TSuu33Bmcl4FfAS5ftz4gU22VTT3YB5GMs9tonPv/OuSdbSunlOEpY8PU
	L6exat+MDA/hX+M6Kp2n75+gXs3gelmEewwbvVYWThlTo5nIIsvvebVtKH+gFwbr7G6Z1esrllG
	3fNeMm81W8WdLLWgurClllU8asmbprVksZeN5icdsY+1o5i6EMzn3Lg0sQub7RPZt6Bb64jLMNp
	/gWtshHuaA5i3PEJlxUTdUfWJ1uYpPEAjqkp/NBMg63/nRPtrcyGnEgyxMOJNVBnPt5Ult
X-Google-Smtp-Source: AGHT+IHHjgzyaRwb6ahN9E8Yr5krWkiTiQSHjHcHXGTexyd1KDeFCQfshwzw0tinYWJxjg9/A2Ywyw==
X-Received: by 2002:a05:600c:3b92:b0:45d:98be:ee92 with SMTP id 5b1f17b1804b1-45ddde6acfdmr155038495e9.8.1757501467539;
        Wed, 10 Sep 2025 03:51:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247bdesm23349925e9.14.2025.09.10.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:51:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] maintainers.inc: unassign Otavio Salvador
Date: Wed, 10 Sep 2025 12:50:52 +0200
Message-Id: <20250910105053.315379-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910105053.315379-1-alex.kanavin@gmail.com>
References: <20250910105053.315379-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223196

From: Alexander Kanavin <alex@linutronix.de>

Same as other unassignments: no update activity for a long time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f69939413a9..ece809f61a6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -278,8 +278,8 @@ RECIPE_MAINTAINER:pn-igt-gpu-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-inetutils = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER:pn-init-ifupdown = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-init-system-helpers = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER:pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER:pn-initramfs-boot = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-initramfs-framework = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-initramfs-live-boot = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-initramfs-live-boot-tiny = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-initramfs-live-install = "Unassigned <unassigned@yoctoproject.org>"
@@ -317,7 +317,7 @@ RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libacpi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libadwaita = "Simone Weiß <simone.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-libaio = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER:pn-libarchive = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libatomic-ops = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
@@ -335,7 +335,7 @@ RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER:pn-libdrm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-liberation-fonts = "Unassigned <unassigned@yoctoproject.org>"
@@ -473,7 +473,7 @@ RECIPE_MAINTAINER:pn-libyaml = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-lighttpd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-yocto-fitimage = "Adrian Freihofer <adrian.freihofer@siemens.com>"
-RECIPE_MAINTAINER:pn-linux-firmware = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER:pn-linux-firmware = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -519,9 +519,9 @@ RECIPE_MAINTAINER:pn-matchbox-wm = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mc = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mdadm = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER:pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER:pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.39.5


