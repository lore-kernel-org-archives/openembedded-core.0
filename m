Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F55EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:50:08 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.1981.1704732603828157158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bvYKi8BG;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso22187335e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704732601; x=1705337401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f03UG5j3w762OOxwPcOEEgcUwEIvQyWV4yrYrWzHGY4=;
        b=bvYKi8BGQXzFRPo4nupBqIs195fQnUpTsj9DUwpVW+SIhpI0YThOCloFgtRYGPYUFz
         OidaAqtSNhjnVggPKD1Hcs2i5FUMVwdWgf0b5yYzCn0H8p2sdrBq9Az7Imyd2z/TSpF5
         42ntEgyTo0xpFIlZFG2QPxYqAq526fSzd1A409gwtB7ZUa3vsQ7FgGnXd8BxJwiLPOIB
         tNOfHlUVOzqy11LZ89cPd2731haYiTK6o0kCjkN+OLZPS2QMLqhRjEigTBAj8jR/Az10
         i4sQm4sMOvadgurQFkXnyX6I6jNOU42bQge/UQXrjk/K7Sjbkfqqcjuatosn1cKsesY2
         WBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704732601; x=1705337401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f03UG5j3w762OOxwPcOEEgcUwEIvQyWV4yrYrWzHGY4=;
        b=pdW8pTiU0x68dBGp2qybguArbRkE7V31JHXCckmkRQazlbj37a3OUfgUczMjjl2HzZ
         v3CaT7mllN4Mc7FvQOUkk1cRSS1C8z+wWzIf99VnfhdFQZDcBTDhcK8v7kAkosdOYtFV
         9ZaXb8+15LFPrCDKQLYTpOV6k1Sw1PlJcUtHSLjjRXTvmB3zIBCChTAiJH+ONFX1qN6J
         Yq3Icc7v+YIte1rZMPAmvnreRge6I7vTEpx3seWkmPpJR7jK+r1LVqr811y41qJdAhOZ
         6dFvz/qttN5dfda8FkM2zVi5l/MyZKNjjoPYSwCFKA6eLN/PHTNfyxNW9WsiiGwU/y/P
         lxjg==
X-Gm-Message-State: AOJu0Yywk+zdKAG4Eaz9rPLpWEWgSAH9OIbkwLbQwWNge3qt2Sa8q+XJ
	d/wQa0AZj+a31Iw0vOsSonvKBZem1uAKjuW2z81JNBgPC//b32S8
X-Google-Smtp-Source: AGHT+IE89oNmX0LuoFQrAWdojsWGVedS/QpP3MSCfsdJMk/7pwlfHddpgZ4pmx8WWKXgCfzC8SGmlw==
X-Received: by 2002:a05:600c:45cd:b0:40d:88ba:e4c7 with SMTP id s13-20020a05600c45cd00b0040d88bae4c7mr1057032wmo.149.1704732601177;
        Mon, 08 Jan 2024 08:50:01 -0800 (PST)
Received: from heaven.lan ([46.255.205.53])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b0040e418494absm385134wmq.46.2024.01.08.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:50:00 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] systemd: add udev-bash-completion package
Date: Mon,  8 Jan 2024 17:49:57 +0100
Message-Id: <20240108164957.860552-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193425

Move the 'udevadm' autocompletion script into a dedicated package.
Indeed, bash (and therefore, the bash-completion package) is not
always installed. But the 'udevadm' autocompletion script remains
in ${datadir}/bash-completion.

Creating a dedicated package allows better split, and avoids
installing it if the bash-completion package is missing.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git meta/recipes-core/systemd/systemd_254.4.bb meta/recipes-core/systemd/systemd_254.4.bb
index 0c12926bef..05cfc734bf 100644
--- meta/recipes-core/systemd/systemd_254.4.bb
+++ meta/recipes-core/systemd/systemd_254.4.bb
@@ -408,6 +408,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-zsh-completion \
     libsystemd-shared \
     udev \
+    udev-bash-completion \
     udev-hwdb \
 "
 
@@ -721,6 +722,7 @@ FILES:libsystemd-shared = "${rootlibdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
 FILES:udev += "${base_sbindir}/udevd \
@@ -782,10 +784,10 @@ FILES:udev += "${base_sbindir}/udevd \
                ${base_bindir}/systemd-hwdb \
                ${base_bindir}/udevadm \
                ${base_sbindir}/udevadm \
-               ${datadir}/bash-completion/completions/udevadm \
                ${systemd_system_unitdir}/systemd-hwdb-update.service \
               "
 
+FILES:udev-bash-completion = "${datadir}/bash-completion/completions/udevadm"
 FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
                    "
 
-- 
2.39.2


